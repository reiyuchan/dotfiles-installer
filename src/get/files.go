package get

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"runtime"

	"github.com/mholt/archiver/v3"
)

var archiveDir = "_tmp_" + string(os.PathSeparator) + "dotfiles.zip"
var extractedDir = "_tmp_" + string(os.PathSeparator) + "dotfiles"

func GetFile(url string, path string) (err error) {
	res, err := http.Get(url)
	if err != nil {
		return err
	}
	defer res.Body.Close()
	if err := os.MkdirAll("_tmp_", os.ModePerm); err != nil {
		return err
	}
	file, err := os.Create(archiveDir)
	if err != nil {
		return err
	}

	if res.StatusCode != http.StatusOK {
		return fmt.Errorf(res.Status)
	}
	_, err = io.Copy(file, res.Body)
	if err != nil {
		return err
	}
	file.Close()
	err = extract(file.Name(), extractedDir, path)
	if err != nil {
		return err
	}
	if err := os.Remove(archiveDir); err != nil {
		return err
	}
	return nil
}

func extract(file string, dest string, path string) (err error) {
	err = archiver.Unarchive(file, dest)
	switch currentOS := runtime.GOOS; currentOS {
	case "windows":
		dest += "\\dotfiles-master"
		if err := os.MkdirAll(dest, os.ModePerm); err != nil {
			return err
		}
		if err := os.Rename(dest, path); err != nil {
			return err
		}
		if err := os.Remove(dest); err != nil {
			return err
		}
	default:
		dest += "/dotfiles-master"
		if err := os.MkdirAll(dest, os.ModePerm); err != nil {
			return err
		}
		if err := os.Rename(dest, path); err != nil {
			return err
		}
		if err := os.Remove(dest); err != nil {
			return err
		}
	}
	if err != nil {
		return err
	}
	return nil
}
