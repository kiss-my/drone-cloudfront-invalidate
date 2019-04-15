# Drone CloudFront Invalidate
https://drone.io plugin to invalidate one 
or multiple AWS CloudFront paths.

# Usage
## Invalidate a single path
```
invalidate_cloudfront_images:
  image: kissmy/drone-cloudfront-invalidate
  aws_access_key_id: $AWS_ACCESS_KEY
  aws_secret_access_key: $AWS_SECRET_KEY
  distribution_id: ABCDEFGHIJKLMNOP
  paths: ['/images/*']
```

## Invalidate multiple paths
```
invalidate_cloudfront_assets:
  image: kissmy/drone-cloudfront-invalidate
  aws_access_key_id: $AWS_ACCESS_KEY
  aws_secret_access_key: $AWS_SECRET_KEY
  distribution_id: ABCDEFGHIJKLMNOP
  paths: ['/css/*','/images/*','/js/*']
```

## Per-branch invalidation
```
staging_invalidate_cloudfront_assets:
  image: kissmy/drone-cloudfront-invalidate
  aws_access_key_id: $AWS_ACCESS_KEY
  aws_secret_access_key: $AWS_SECRET_KEY
  distribution_id: ABCDEFGHIJKLMNOP
  paths: ['/css/*','/images/*','/js/*']
  when:
    branch: [develop]
```

# Testing the image locally
```
docker run --rm \
-e PLUGIN_AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID \
-e PLUGIN_AWS_SECRET_ACCESS_KEY="[AWS_SECRET_ACCESS_KEY]" \
-e PLUGIN_DISTRIBUTION_ID=ABCDEFGHIJKLMNOP \
-e PLUGIN_PATHS='/css/*','/images/*','/images/*' \
kissmy/drone-cloudfront-invalidate
```
# License
MIT