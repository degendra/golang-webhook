package main
import (
	"fmt"
	"net/http"
	"encoding/json"
	"log"
	"io/ioutil"
	"io"
)

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Welcome to webhook.\n")
}

func QuayResponse(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(io.LimitReader(r.Body, 1048576))
	if err != nil {
		log.Println(err)
		return
	}
	if err := r.Body.Close(); err != nil {
		log.Println(err)
		return
	}

	go handleQuayResponse(body)

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusCreated)
	if err := json.NewEncoder(w).Encode("OK"); err != nil {
		panic(err)
	}
}

func handleQuayResponse(body []byte) {
	fmt.Println("Message:", body)
}
