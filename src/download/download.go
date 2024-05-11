package download

import (
	"fmt"
	"os"
	"runtime"

	"github.com/reiyuchan/dotfiles-installer/execute"
	"github.com/reiyuchan/dotfiles-installer/get"
)

func Download() (err error) {
	// const win_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.bat"
	// const unix_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.sh"
	const url = "https://github.com/reiyuchan/dotfiles/archive/refs/heads/master.zip"
	path := os.Getenv("HOME")
	switch currentOS := runtime.GOOS; currentOS {
	case "windows":
		path += "\\dotfiles"
		err := get.GetFile(url, path)
		execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}

	default:
		path += "/dotfiles"
		err := get.GetFile(url, path)
		execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
	}
	return nil
}
