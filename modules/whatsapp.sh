#!/usr/bin/env bash

if which google-chrome; then
    google-chrome https://chrome.google.com/webstore/detail/whatschrome/bgkodfmeijboinjdegggmkbkjfiagaan &>/dev/null &
fi

if which brave-browser; then
    brave-browser https://chrome.google.com/webstore/detail/whatschrome/bgkodfmeijboinjdegggmkbkjfiagaan &>/dev/null &
fi
