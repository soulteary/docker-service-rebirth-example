package main

import (
	"os"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, World!")
	})

	r.GET("/mock-crash", func(c *gin.Context) {
		os.Exit(1024)
	})

	stateReady := false
	r.GET("/health", func(c *gin.Context) {
		if stateReady {
			c.JSON(200, "ok")
		} else {
			c.JSON(200, "not ready")
		}
	})

	time.Sleep(5 * time.Second)
	stateReady = true

	r.Run(":8080")
}
