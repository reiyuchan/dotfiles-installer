package execute

import (
	"os/exec"
)

func Execute(filePath string, currentOS string) (err error) {
	var startUpString string
	if currentOS == "windows" {
		startUpString = ".\\"
		filePath += "\\install.bat"
	} else {
		startUpString = "./"
		filePath += "/install.sh"
	}
	path, err := exec.LookPath(startUpString + filePath)
	if err != nil {
		return err
	}
	cmd := exec.Command(path)
	if err := cmd.Run(); err != nil {
		return err
	}
	return nil
}
