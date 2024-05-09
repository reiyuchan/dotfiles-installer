package main

import (
	"fmt"
	"runtime"

	"httpdownloader.com/dotfiles/controllers"
	"httpdownloader.com/dotfiles/execute"
)

func WhichOS() string {
	return runtime.GOOS
}

func Download() {
	const win_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.bat"
	const unix_url = "https://raw.githubusercontent.com/reiyuchan/dotfiles/master/quick-installer/install.sh"
	currentOS := WhichOS()
	var path string
	switch currentOS {
	case "windows":
		path = "install.bat"
		file, err := controllers.GetFile(win_url, path)
		execute.Execute(file, currentOS)
		fmt.Println("Error:" + err.Error())
	default:
		path = "install.sh"
		file, err := controllers.GetFile(unix_url, path)
		execute.Execute(file, currentOS)
		fmt.Println("Error:" + err.Error())
	}
}

func main() {
	Download()
}
