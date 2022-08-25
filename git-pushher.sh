#!/bin/bash

echo "Do you want to push the git project? Please type 'Y' to continue or any keys."
read REQUEST


if [ $REQUEST == 'Y' ]
then
    RESULT=$(git status | grep -i "Changes not staged for commit")
    # echo "Add: $RESULT"
    if [ ! -z "$RESULT" ]
    then
        echo "You have unattached changes. Would you like to add? Please type 'Y' to continue or any keys."
        read REQUEST
        if [ "$REQUEST" = "Y" ]
        then
            echo "Add the changes and run again."
            exit 1 
        fi
    fi    
    
    RESULT=$(git status | grep -i "Changes to be committed")
    # echo "Commit: $RESULT"
    if [ -z "$RESULT" ]
    then
        echo "Exiting..."
        exit 1
    else    
        echo "Commit description: "
        read COMMIT_DESCRIPTION
        # echo "Commit description : $COMMIT_DESCRIPTION"
        git commit -m "$COMMIT_DESCRIPTION"

        echo "Enter branch name: "
        read BRANCH_NAME

        if [ -z "$BRANCH_NAME" ]
        then
            echo "Branch name cannot be empty!"        
            exit 1
        else
            git push origin HEAD:$BRANCH_NAME
        fi
    fi    
else 
    echo "Exiting..."
    exit 1
fi


