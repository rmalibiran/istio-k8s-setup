AWS_ECR_ACCOUNT=<YOUR AWS ACCOUNT ID>
ECR_REGION=ap-southeast-1
ECR_SECRET_NAME=${ECR_REGION}-ecr-registry
EMAIL=<YOUR AWS IAM EMAIL>

#
#

TOKEN=`aws ecr --region=$ECR_REGION get-authorization-token --output text \
    --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2`

#
#  Create or replace registry secret
#


kubectl delete secret --ignore-not-found $ECR_SECRET_NAME
kubectl create secret docker-registry $ECR_SECRET_NAME \
    --docker-server=https://${AWS_ECR_ACCOUNT}.dkr.ecr.${ECR_REGION}.amazonaws.com \
    --docker-username=AWS \
    --docker-password="${TOKEN}" \
    --docker-email="${EMAIL}"