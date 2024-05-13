package install

import (
	"fmt"
	"os"
	"runtime"

	"github.com/reiyuchan/dotfiles-installer/execute"
	"github.com/reiyuchan/dotfiles-installer/get"
)

func Install() (err error) {
	const url = "https://github.com/reiyuchan/dotfiles/archive/refs/heads/master.zip"
	path := os.Getenv("HOME")

	switch currentOS := runtime.GOOS; currentOS {
	case "windows":
		path += "\\dotfiles"
		err = get.GetFile(url, path)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
		err = execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
	default:
		path += "/dotfiles"
		err := get.GetFile(url, path)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
		err = execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
	}
	return nil
}
