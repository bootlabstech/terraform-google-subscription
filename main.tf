resource "google_pubsub_subscription" "subscription" {
  count                      = var.no_of_subscriptions
  project                    = var.project_id
  name                       = var.subscription_name[count.index]
  topic                      = var.topic_name
  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = var.retain_acked_messages

  expiration_policy {
    ttl = "605000s"
  }
  ack_deadline_seconds         = var.ack_deadline_seconds
  #enable_exactly_once_delivery = var.enable_exactly_once_delivery
  enable_message_ordering      = var.enable_message_ordering

  dynamic "push_config" {
    for_each = var.push_config ? [{}] : []
    content {
      push_endpoint = var.push_endpoint
      attributes    = var.attributes
    }
  }

  dynamic "dead_letter_policy" {
    for_each = var.dead_letter_policy ? [{}] : []
    content {
      dead_letter_topic     = var.dead_letter_topic
      max_delivery_attempts = var.max_delivery_attempts
    }
  }

  dynamic "retry_policy" {
    for_each = var.retry_policy ? [{}] : []
    content {
      minimum_backoff = var.minimum_backoff
      maximum_backoff = var.maximum_backoff
    }

  }
}