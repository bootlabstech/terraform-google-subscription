variable "project_id" {
  type        = string
  description = "The project in which the pubsub resource is created in"

}
variable "message_storage_policy" {
  type        = string
  description = "A map of storage policies. Default - inherit from organization's Resource Location Restriction policy."
  default     = false

}
variable "schema_settings" {
  type        = string
  description = "value"
  default     = false

}
variable "subscription_name" {
  type        = list(string)
  description = "The name of the PubSub subscriptions"

}
variable "message_retention_duration" {
  type        = string
  description = "How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published"
  default     = "604800s"

}
variable "retain_acked_messages" {
  type        = string
  description = " Indicates whether to retain acknowledged messages"
  default     = true

}
variable "ack_deadline_seconds" {
  type        = string
  description = " This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message"
  default     = 20

}
variable "enable_exactly_once_delivery" {
  type        = string
  description = "The message sent to a subscriber is guaranteed not to be resent before the message's acknowledgement deadline expires."
  default     = false
}
variable "enable_message_ordering" {
  type        = string
  description = "Indicates if messages are delivered in the order they are sent."
  default     = false
}
variable "push_config" {
  type        = string
  description = "If push delivery is used with this subscription, this field is used to configure it.."
  default     = false
}
variable "dead_letter_policy" {
  type        = string
  description = "A policy that specifies the conditions for dead lettering messages in this subscription."
  default     = false
}
variable "retry_policy" {
  type        = string
  description = "A policy that specifies the retry limit in this subscription."
  default     = false
}
variable "no_of_subscriptions" {
  type        = number
  description = "The number of subscriptions to be created."
}
variable "topic_name" {
  type        = string
  description = "The topic for which the subscription is being created."
}

