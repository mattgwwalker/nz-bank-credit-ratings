#!/bin/bash

rm ratings.sqlite3
sqlite3 ratings.sqlite3 < ratings.sql
