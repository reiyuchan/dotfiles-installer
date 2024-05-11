package main

import (
	"fmt"

	"github.com/reiyuchan/dotfiles-installer/download"
)

func main() {
	err := download.Download()
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("Installed successfully..!")
	}
	fmt.Println("Press enter to continue..!")
	fmt.Scanln()
}
