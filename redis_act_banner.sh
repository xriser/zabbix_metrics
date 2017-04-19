#!/bin/bash

redis-cli scard allow:router |awk "{print $1}"
