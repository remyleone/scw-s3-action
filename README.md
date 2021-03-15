# Github action for Scaleway S3

```yaml
- name: S3 Sync
  uses: remyleone/scw-s3-action@master
  with:
    args: s3
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.SCW_ACCESS_KEY }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.SCW_SECRET_KEY }}
    AWS_DEFAULT_REGION: "fr-par-1"
```
