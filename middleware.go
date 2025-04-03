package main

import (
	"context"
	"errors"

	"github.com/philipp-reber/blog_aggregator/internal/database"
)

func middlewareLoggedIn(handler func(s *state, cmd command, user database.User) error) func(*state, command) error {
	return func(s *state, cmd command) error {
		// Retrieve the logged-in user from the state or session
		user, err := s.db.GetUser(context.Background(), s.cfg.CurrentUserName)
		if err != nil {
			return errors.New("user not logged in")
		}

		// Call the original handler with the user
		return handler(s, cmd, user)
	}
}
