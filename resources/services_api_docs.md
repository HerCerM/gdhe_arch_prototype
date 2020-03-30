# Services API Documentation

## Table of contents

<!-- TOC -->

- [Services API Documentation](#services-api-documentation)
    - [Table of contents](#table-of-contents)
    - [Services required on each view](#services-required-on-each-view)
    - [Services](#services)
        - [GET(user)BY(credentials)](#getuserbycredentials)
            - [Request](#request)
            - [Response](#response)
            - [Error HTTP code](#error-http-code)
        - [GET(groups)GB(major)](#getgroupsgbmajor)
            - [Response](#response-1)
        - [GET(classes)BY(group_id)](#getclassesbygroup_id)
            - [Request](#request-1)
            - [Response](#response-2)
        - [GET(courses)BY(group_id)](#getcoursesbygroup_id)
            - [Request](#request-2)
            - [Response](#response-3)
        - [GET(classrooms)](#getclassrooms)
            - [Response](#response-4)
        - [POST(class)](#postclass)
            - [Request](#request-3)
            - [Error HTTP code](#error-http-code-1)
        - [POST(approve_group)](#postapprove_group)
            - [Request](#request-4)

<!-- /TOC -->

## Services required on each view

| View |Service |
|---|---|
| Login | [GET(user)BY(credentials)](#getuserbycredentials) |
| Groups Catalog | [GET(groups)GB(major)](#getgroupsgbmajor)<br>[GET(classes)BY(group_id)](#getclassesbygroup_id)<br>[POST(approve_group)](#postapprove_group) |
| Groups Edit | [GET(courses)BY(group_id)](#getcoursesbygroup_id)<br>[GET(classes)BY(group_id)](#getclassesbygroup_id)<br>[POST(class)](#postclass)<br>[POST(approve_group)](#postapprove_group)<br>[GET(classrooms)](#getclassrooms) |

## Services

### GET(user)BY(credentials)

#### Request

```json
{
  "username": "('A' | 'P' | 'S')<user_code>",
  "password": "<password>"
}
```

#### Response

```json
{
  "type": "('A' | 'P' | 'S')",
}
```

#### Error HTTP code

401 Unauthorized

### GET(groups)GB(major)

#### Response

```json
{
    "<major>":
        [
            {
                "group_id": "<INTEGER>",
                "approved": "(0 | 1)",
                "group_letter": "<'A'-'Z'>",
                "semester": "<INTEGER>"
            }
        ]

}
```

### GET(classes)BY(group_id)

#### Request

```json
{
    "group_id": "<INTEGER>"
}
```

#### Response

```json
[
    {
        "start_hour": "<24-format>",
        "end_hour": "<24-format>",
        "classroom_name": "<classroom>",
        "course_id": "<INTEGER>",
        "weekday": "('mon' | 'tue' | 'wed' | 'thu' | 'fri' | 'sat' | 'sun')"
    }
]
```

### GET(courses)BY(group_id)

#### Request

```json
{
    "group_id": "<INTEGER>"
}
```

#### Response

```json
[
    {
        "course_id": "<INTEGER>",
        "professor_name": "<name>",
        "subject_name": "<name>",
        "required_hours": "<FLOAT>"
    }
]
```

### GET(classrooms)

#### Response

```json
["<classroom_name>"]
```

### POST(class)

#### Request

```json
{
    "start_hour": "<24-format>",
    "end_hour": "<24-format>",
    "classroom_name": "<classroom>",
    "course_id": "<INTEGER>",
    "weekday": "('mon' | 'tue' | 'wed' | 'thu' | 'fri' | 'sat' | 'sun')"
}
```

#### Error HTTP code

409 Conflict

### POST(approve_group)

#### Request

```json
{
    "group_id": "<INTEGER>",
    "approved": "(0 | 1)"
}
```
