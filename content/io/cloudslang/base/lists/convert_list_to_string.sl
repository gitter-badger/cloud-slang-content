#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Convert items of a given list to string and concatenate them in result
#
# Inputs:
#   - list - the list of item that will be converted to string and concatenated in result - Example: [123, 'xyz']
#   - double_quotes - optional - if True every list item will be double quoted before concatenation - Default: False
#   - result_delimiter - optional - if True will be appended after every list item (except the last one) before concatenation - Default: "''"
#   - result_to_lowercase - optional - if True the result will be a string in lowercase only - Default: False
# Outputs:
#   - result - the string that results from concatenation of list elements
####################################################

namespace: io.cloudslang.base.lists

operation:
  name: convert_list_to_string
  inputs:
    - list
    - double_quotes:
        default: False
        required: false
    - result_delimiter:
        default: "''"
        required: false
    - result_to_lowercase:
        default: False
        required: false
  action:
    python_script: |
      result = ''
      list_length = len(list)
      for item in list:
        result += '\"' + str(item) + '\"' if bool(double_quotes) else str(item)
        list_length -= 1
        if (list_length > 0 and result_delimiter != ''):
          result += str(result_delimiter)
      result = result.lower() if bool(result_to_lowercase) else result
  outputs:
    - result