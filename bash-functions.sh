#!/bin/bash

# Function to delete all scratch orgs
function deleteSO() {
    echo 'Deleting scratch orgs..'
    local orgs=$(sfdx force:org:list --json)
    for org in $(echo "${orgs}" | jq -r '.result.scratchOrgs[].signupUsername'); do
        sfdx force:org:delete -p -u ${org}
    done
}

# Function to log out of all non-scratch orgs
function logoutOrgs() {
    echo 'Logging out of non-scratch orgs..'
    local orgs=$(sfdx force:org:list --json)
    for org in $(echo "${orgs}" | jq -r '.result.nonScratchOrgs[].username'); do
        sfdx force:auth:logout -p -u ${org}
    done
}

# Function to display all scratch orgs
function displaySO() {
    echo 'Displaying all scratch orgs..'
    local orgs=$(sfdx force:org:list --json)
    for org in $(echo "${orgs}" | jq -r '.result.scratchOrgs[].signupUsername'); do
        sfdx force:org:display -u ${org}
    done
}
