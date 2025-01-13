#!/bin/bash

function log_archive() {
	tar -czf log_archive_$1.tar.gz $2
}
