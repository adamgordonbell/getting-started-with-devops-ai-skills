#!/usr/bin/env bash
# break-checkout.sh — the chapter-10 incident. Puts a one-character typo in the
# checkout Service's selector ("chekout"), so the service goes dark while every
# pod stays green: no crashloop, no warning events, nothing the installed skills
# fire on. That gap is the point — explore it with Claude, then extract the
# findings into a new skill with skill-creator.
#
#   ./demo/break-checkout.sh          # break it
#   ./demo/break-checkout.sh --fix    # restore the correct selector
#   ./demo/break-checkout.sh --test   # curl it from inside the cluster
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "${1:-}" in
  --fix)
    kubectl apply -f "$HERE/k8s/checkout.yaml" >/dev/null
    echo "fixed: selector restored to app.kubernetes.io/name=checkout"
    kubectl -n demo get endpoints checkout
    ;;
  --test)
    kubectl -n demo run curl-test --rm -i --restart=Never --image=busybox:1.36 \
      -- wget -qO- -T 3 http://checkout.demo.svc/ \
      && echo "service is UP" || echo "service is DOWN"
    ;;
  "")
    kubectl -n demo patch service checkout --type merge \
      -p '{"spec":{"selector":{"app.kubernetes.io/name":"chekout"}}}' >/dev/null
    echo "broken: Service selector now says 'chekout' (endpoints will be empty)"
    kubectl -n demo get endpoints checkout
    ;;
  *)
    sed -n '2,11p' "$0"; exit 2 ;;
esac
