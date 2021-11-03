echo ----------------------------------------------------------------
echo running tests
echo ----------------------------------------------------------------

TEST_RESULTS=$(npm test)

TESTS_FAILED=$(echo $TEST_RESULTS | grep -oP '(?<=numFailedTests":)[0-9]*')
TESTS_PASSED=$(echo $TEST_RESULTS | grep -oP '(?<=numPassedTests":)[0-9]*')

curl -s -H "X-Org-ID: 6461097"\
    -H "Authorization: OAuth $TRACKER_ACCESS_TOKEN"\
    -H "Content-Type: application/json"\
    -d "{\"description\": \"$RELEASE_DESCRIPTION\n Tests: passed - $TESTS_PASSED, failed - $TESTS_FAILED\"}"\
    -X PATCH $TICKET_URL
