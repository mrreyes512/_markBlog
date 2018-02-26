#/bin/bash
#----------------------------------------
# JBH - Jekyll Blog Helper
_version="1.2.1"
# http://github.com/alanbarber/jbh
#----------------------------------------
# Settings
# Note: Always set leading and trailing slashes in path! Paths are relative.

_date=$(date +%Y-%m-%d)
_postDate=$(date +%Y-%m-%d)
_postPath="/_posts/"
_draftPath="/_drafts/"

_excerptSeparator="/--more--/"

# Helper Function
function fnConvertTitleToFilenameFormat {
	# lowercase, remove non alphanumerics and non spaces, convert spaces to dash
	local _title=$(echo "$@" | sed -e 's/\(.*\)/\L\1/')
	_title=$(echo $_title | sed -e 's/[[:punct:]]//g')
	_title=$(echo $_title | sed -e 's/\s/-/g')
	echo "$_title"
}
function fnGetFileNameFromDateAndTitle {
	local _title=$(fnConvertTitleToFilenameFormat "$@")
	local _date=$(date +%Y-%m-%d)
	echo "$_date-$_title.md"
}

# New Post
function fnNew {
	echo "Creating new post..."
	if [[ "$1" == "-d" || "$1" == "--draft" ]]; then
		echo "  Making post a draft..."
		local _title="$2"
		local _path="$_draftPath"
	else
		_title="$1"
		local _path="$_postPath"
	fi
	# setup vars
  local _date=$(date +%Y-%m-%d)
	local _fileName=$(fnGetFileNameFromDateAndTitle "$_date" "$_title")
	local _outputFile="$_path$_fileName"

	# Create file and write Jekyll header info
	echo "  Creating file '$_outputFile'..."
	echo "    Title: $_title"
	echo "    Date: $_date"

	echo "---" > ".$_outputFile"
	echo "layout: post" >> ".$_outputFile"
	echo "title: \"$_title\"" >> ".$_outputFile"
	echo "date: $_date" >> ".$_outputFile"
	echo "categories: []" >> ".$_outputFile"
	echo "tags: []" >> ".$_outputFile"
	echo "---" >> ".$_outputFile"
}
