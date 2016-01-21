package main
import (
	"log"
	"net/http"
	"fmt"
)

func main() {
	fmt.Println("Starting Server ....")
	router := NewRouter()
	log.Fatal(http.ListenAndServe(":8080", router))
}
