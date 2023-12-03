
resource "aws_resourcegroups_group" "tf_group" {
  name = "dp-${var.environment_short}-${var.location_short}-tf-rg"

  resource_query {
    query = <<JSON
{
  "TagFilters": [
    {
      "Key": "Stage",
      "Values": ["Test"]
    }
    {
      "Key": "Solution",
      "Values": ["Tf_Backend"]
    }
  ]
}
JSON
  }
}