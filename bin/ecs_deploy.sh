#! /bin/bash

TRAVIS_BRANCH_UPPERCASE=$(echo $TRAVIS_BRANCH | awk '{print toupper($0)}')

CLUSTER_NAME=ECS_CLUSTER_${TRAVIS_BRANCH_UPPERCASE}
SERVICE_NAME=ECS_SERVICE_${TRAVIS_BRANCH_UPPERCASE}

echo "Deploying $TRAVIS_BRANCH on service ${!SERVICE_NAME} on cluster ${!CLUSTER_NAME} with image $REMOTE_IMAGE_URL:latest"
${SCRIPTDIR}/../lib/ecs-deploy -t 300 -n ${!SERVICE_NAME} -c ${!CLUSTER_NAME} -r $AWS_REGION -i $REMOTE_IMAGE_URL:latest --desired-count 2 --enable-rollback
