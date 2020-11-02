package main

import (
	"flag"
	"fmt"
)

var (
	isEnabled = flag.Bool("enable", false, "To enable something")
	port      = flag.String("port", "8080", "The port of http.")
	count     = flag.Int("count", 10, "Set count")
)

/**
 * Show Help: `go run . --help` or `go run . -h`
 */
func main() {

	flag.Parse()

	var args = flag.Args()

	// command: go run . --port 8000 Hello
	// print: false 8000 10 [Hello]
	fmt.Println(args, *isEnabled, *port, *count)

}
