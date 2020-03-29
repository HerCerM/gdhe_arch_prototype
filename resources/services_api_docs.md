# Services API Documentation

## Services required on each view

| View |Service |
|---|---|
| Login | [GET(user)BY(credentials)](#GET(user)BY(credentials)) |
| Groups Catalog | [GET(groups)GB(major)](#GET(groups)GB(major))<br>[GET(classes)BY(group_id)](#GET(classes)BY(group_id)) |
| Groups Edit | [GET(courses)BY(group_id)](#GET(courses)BY(group_id))<br>[GET(classes)BY(group_id)](#GET(classes)BY(group_id))<br>[POST(class)](#POST(class))<br>[POST(approve_group)](#POST(approve_group)) |

## Services

### GET(user)BY(credentials)

#### Request

```json
{
  "username": ("A" | "P" | "S")<user_code>,
  "password": "<password>"
}
```

#### Response

```json
{
  "type": ("A" | "P" | "S"),
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
                "group_id": <INTEGER>,
                "approved": (0 | 1),
                "group_letter": <"A"-"Z">,
                "semester": <INTEGER>
            }
        ]

}
```

### GET(classes)BY(group_id)

#### Request

```json
{
    "group_id": <INTEGER>
}
```

#### Response

```json
[
    {
        "start_hour": <24-format>,
        "end_hour": <24-format>,
        "classroom_name": <classroom>,
        "course_id": <INTEGER>,
        "weekday": ("mon" | "tue" | "wed" | "thu" | "fri" | "sat" | "sun")
    }
]
```

### GET(courses)BY(group_id)

#### Request

```json
{
    "group_id": <INTEGER>
}
```

#### Response

```json
[
    {
        "course_id": <INTEGER>,
        "professor_name": <name>,
        "subject_name": <name>,
        "required_hours": <INTEGER>
    }
]
```

### POST(class)

#### Request

```json
{
    "start_hour": <24-format>,
    "end_hour": <24-format>,
    "classroom_name": <classroom>,
    "course_id": <INTEGER>,
    "weekday": ("mon" | "tue" | "wed" | "thu" | "fri" | "sat" | "sun")
}
```

#### Error HTTP code

409 Conflict

### POST(approve_group)

#### Request

```json
{
    "group_id": <INTEGER>
}
```
