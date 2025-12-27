(define-data-var action-count uint u0)

(define-map actions uint
  { sender: principal, message: (string-utf8 100), block: uint }
)

(define-public (post-action (message (string-utf8 100)))
  (begin
    (var-set action-count (+ (var-get action-count) u1))
    (map-set actions
      (var-get action-count)
      { sender: tx-sender, message: message, block: block-height }
    )
    (ok (var-get action-count))
  )
)
