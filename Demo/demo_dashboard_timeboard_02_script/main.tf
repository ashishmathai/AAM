# Provider
# --------
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
  required_version = ">= 0.13"
}

# API keys for the provider
# -------------------------
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

resource "datadog_dashboard" "Ashish-demo-script" {
  title        = "Ashish-demo-script"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "ordered"
  is_read_only = false


  widget {
    query_value_definition {
      request {
        q          = "sum:trace.MySQLdb.connection.commit{$scope}.as_count()"
        aggregator = "avg"
        conditional_formats {
          palette    = "white_on_red"
          value      = 1
          comparator = ">"
        }
      }
      autoscale  = true
      precision  = "2"
      text_align = "center"
      title_size = 13
      title      = "DB Connection Commit"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.write_iops{$engine} by {dbinstanceidentifier}.as_rate()"
        display_type = "line"
        style {
          palette    = "orange"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "Write I/O"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.read_throughput{$scope} by {dbinstanceidentifier}.as_count()"
        display_type = "line"
        style {
          palette    = "cool"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "Read Throughput"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.read_throughput{$scope} by {dbinstanceidentifier}.as_count()"
        display_type = "line"
        style {
          palette    = "cool"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "Read Throughput"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.swap_usage{$scope} by {name}"
        display_type = "line"
        style {
          palette    = "cool"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "RDS Swap usage"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.queries{$scope} by {name}.as_count()"
        display_type = "line"
        style {
          palette    = "green"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "Read Queries"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:aws.rds.read_iops{$engine} by {dbinstanceidentifier}.as_rate()"
        display_type = "line"
        style {
          palette    = "green"
          line_type  = "solid"
          line_width = "thin"
        }
      }
      yaxis {
        scale        = "linear"
        min          = "auto"
        max          = "auto"
        include_zero = true
        label        = ""
      }
      title_align = "center"
      title_size  = 13
      title       = "Read I/O"
    }
  }

  ###--------------------SCOPE------------------------###

  template_variable {
    name    = "scope"
    prefix  = "*"
    default = "*"
  }
  template_variable {
    name    = "environment"
    prefix  = "environment"
    default = "prod"
  }

  template_variable {
    name    = "engine"
    prefix  = "engine"
    default = "mysql"
  }

}
