package controllers

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

func GetFile(url string, path string) (fileName string, err error) {

	res, err := http.Get(url)
	if err != nil {
		return fileName, err
	}
	defer res.Body.Close()
	if err := os.MkdirAll(path, os.ModePerm); err != nil {
		return fileName, err
	}
	file, err := os.Create(path)
	if err != nil {
		return fileName, err
	}
	defer file.Close()

	if res.StatusCode != http.StatusOK {
		return fileName, fmt.Errorf(res.Status)
	}
	_, err = io.Copy(file, res.Body)
	return fileName, nil
}
