package execute

import (
	"os"
	"os/exec"
)

func Execute(fileName string, currentOS string) (err error) {
	var startUpString string
	if currentOS == "windows" {
		startUpString = ".\\"
	} else {
		startUpString = "./"
	}
	path, err := exec.LookPath(startUpString + fileName)
	if err != nil {
		return err
	}
	cmd := exec.Command(path)
	if err := cmd.Run(); err != nil {
		return err
	}
	if err := os.Remove(fileName); err != nil {
		return err
	}
	return nil
}
