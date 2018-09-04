#!/bin/bash

# Function to delete all scratch orgs
function deleteSO() {
    echo 'Deleting scratch orgs..'
    local orgs=$(sfdx force:org:list --json)
    for org in $(echo "${orgs}" | jq -r '.result.scratchOrgs[].signupUsername'); do
        sfdx force:org:delete -p -u ${org}
    done
}