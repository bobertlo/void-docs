TRAVIS_COMMIT_RANGE=${TRAVIS_COMMIT_RANGE:-HEAD~1}

echo $TRAVIS_COMMIT_RANGE

CHANGED_FILES=$(git diff --name-only $TRAVIS_COMMIT_RANGE | grep .md$)

for f in $CHANGED_FILES; do
	cat $f | aspell --extra-dicts=./ci/aspell.pws list
done
