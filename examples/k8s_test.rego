package kubernetes.my_thing


testInput = {
  "msg": "test message",
}

parameters = {
  "tags": [
    "test",
    "latest"
    ]
}

review_tagged = {
  "object": {
    "spec": {
      "containers": [
        {
          "image": "library/default-image:good_tag",
          
        }
      ]
    }
  }
}

review_latest = {
  "object": {
    "spec": {
      "containers": [
        {
          "image": "library/default-image:latest",
          
        }
      ]
    }
  }
}

test_review_latest {
  violation[out] with input.review as review_latest with input.parameters as parameters
  re_match("has banned image tag", out.msg)
}

test_review_tagged {
  count(violation) == 0 with input.review as review_tagged with input.parameters as parameters
}
