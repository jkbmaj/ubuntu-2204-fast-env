#!/usr/bin/env bash

if ! which cpufreq-info > /dev/null; then
	apt install --yes cpufrequtils
fi