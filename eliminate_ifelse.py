#!/usr/bin/env python3
"""
Eliminate ifelse() functions by selecting the default (false) branch.
For nested ifelse, recursively extracts the final fallback value.
"""

import re
import sys

def extract_ifelse_fallback(text):
    """
    Recursively extract the final fallback value from ifelse expressions.
    ifelse(cond, true_val, false_val) -> false_val
    ifelse(cond, true_val, ifelse(cond2, val2, val3)) -> val3
    """
    def find_matching_paren(s, start):
        """Find the closing parenthesis matching the opening one at start."""
        count = 1
        i = start + 1
        while i < len(s) and count > 0:
            if s[i] == '(':
                count += 1
            elif s[i] == ')':
                count -= 1
            i += 1
        return i - 1 if count == 0 else -1

    def extract_fallback(expr):
        """Extract the fallback value from an ifelse expression."""
        # Remove outer 'ifelse(' and ')'
        if not expr.startswith('ifelse('):
            return expr

        inner = expr[7:]  # Remove 'ifelse('

        # Find the three parameters by tracking parentheses and commas
        params = []
        current_param = ""
        paren_depth = 0

        for i, char in enumerate(inner):
            if char == '(':
                paren_depth += 1
                current_param += char
            elif char == ')':
                if paren_depth == 0:
                    # End of ifelse
                    if current_param:
                        params.append(current_param.strip())
                    break
                paren_depth -= 1
                current_param += char
            elif char == ',' and paren_depth == 0:
                params.append(current_param.strip())
                current_param = ""
            else:
                current_param += char

        if len(params) >= 3:
            # Return the fallback (third parameter), recursively processed
            fallback = params[2]
            if 'ifelse(' in fallback:
                return extract_fallback(fallback)
            return fallback
        elif len(params) == 2:
            # Malformed, return second param
            return params[1]
        else:
            # Fallback to original
            return expr

    # Process all ifelse() calls in the text
    result = text
    while 'ifelse(' in result:
        # Find each ifelse
        match = re.search(r'ifelse\(', result)
        if not match:
            break

        start = match.start()
        end = find_matching_paren(result, start + 6)  # 6 = len('ifelse')

        if end == -1:
            # Couldn't find matching paren, skip this one
            result = result[:start] + result[start+7:]
            continue

        ifelse_expr = result[start:end+1]
        fallback_value = extract_fallback(ifelse_expr)

        # Replace the entire ifelse with its fallback
        result = result[:start] + fallback_value + result[end+1:]

    return result

# Read file, process, write back
if __name__ == '__main__':
    filename = sys.argv[1]

    with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    modified = extract_ifelse_fallback(content)

    with open(filename, 'w', encoding='utf-8') as f:
        f.write(modified)

    print(f"Processed {filename}")
