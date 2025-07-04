# Localosmosis
mod osmosis './localosmosis/justfile'
# cosmwasm-optimizer
mod cosmwasm './cosmwasm-optimizer/justfile'

# List all recipes
default:
	just --list --unsorted

# Build images
build:
	just osmosis::build
	just cosmwasm::build

# Push images
push-images:
	just osmosis::push-image
	just cosmwasm::push-image
