#!/bin/bash

log_date=$(date '+%Y%m%d')
log_time=$(date '+%H%M%S')

log_archive() {
	tar -czf $1_${log_date}_${log_time}.tar.gz $2
}
