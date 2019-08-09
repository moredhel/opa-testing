# Kubernetes Admission Control Invariants

package kubernetes.my_thing

import data.kubernetes.ingresses
import data.kubernetes.namespaces

# violations[{
  # "name": name
# }] {
# "test" = name
# true
# }

# Simple policy defined.
violation[{"msg": msg}] {
  container := input.review.object.spec.containers[_]
  img_split := split(container.image, ":")
  tag := img_split[count(img_split) - 1]
  banned := {s | s = input.parameters.tags[_]}
  banned[tag]
  msg := sprintf("container <%v> has banned image tag <%v>, banned tags are %v", [container.name, tag, banned])
}
