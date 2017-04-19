#!/bin/bash

mysql -h host -u user --password="pass" -Bse "SELECT sum(today_show_count) FROM banner.banner_site_stat;"


