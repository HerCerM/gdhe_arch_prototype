# Services API Documentation

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
