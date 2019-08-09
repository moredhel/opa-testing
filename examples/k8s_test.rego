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

# Here I am trying to execute the violation and verify that it is working as expected
test_sample {
  # not violation[testInput] with input.review as review_latest with input.parameters as parameters
  violation[testInput] with input.review as review_tagged with input.parameters as parameters
}
