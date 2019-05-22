# Facebook Pixel
This is an **unnofficial** conversion pixel template for Facebook.

# Author
Simo Ahava (https://www.simoahava.com/).

# Release notes
| Date | Notes |
|------|-------|
| 18 May 2019 | First version of the pixel released. |

# Details
See [this article](https://www.simoahava.com/analytics/create-facebook-pixel-custom-tag-template/) for details about the creation process. You can also watch [this video](https://www.youtube.com/watch?v=5ESEtwq7fxc) for a rundown of how the template was built.

The template supports all the features of the conversion pixel, including:

1. **Multiple pixel IDs**, each separated by a comma in the `Facebook Pixel ID(s)` field.

2. **Standard and custom events**.

3. **Advanced Matching parameters**.

4. **User ID and user properties**.

5. **Object properties**.

6. **Disable automatic configuration of the pixel**.

The pixel initialization is deduped so that each given pixel ID can only be initialized once per page, regardless of how many times the tag (or any tag using the same template and the same pixel ID) fires.
