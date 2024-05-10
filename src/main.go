package main

import (
	"fmt"
	"os"
	"runtime"

	"github.com/reiyuchan/dotfiles-installer/controllers"
	"github.com/reiyuchan/dotfiles-installer/execute"
)

func WhichOS() string {
	return runtime.GOOS
}

func Download() (err error) {
	// const win_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.bat"
	// const unix_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.sh"
	const url = "https://github.com/reiyuchan/dotfiles/archive/refs/heads/master.zip"
	path := os.Getenv("HOME")
	switch currentOS := WhichOS(); currentOS {
	case "windows":
		path += "\\dotfiles"
		err := controllers.GetFile(url, path)
		execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}

	default:
		path += "/dotfiles"
		err := controllers.GetFile(url, path)
		execute.Execute(path, currentOS)
		if err != nil {
			return fmt.Errorf("Error:" + err.Error())
		}
	}
	return nil
}

func main() {
	err := Download()
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("Installed successfully..!")
	}
	fmt.Println("Press enter to continue..!")
	fmt.Scanln()
}
