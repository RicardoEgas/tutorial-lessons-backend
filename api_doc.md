<h1>Sign up</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/users</p>
<p><strong>method: </strong>POST</p>

### Body

```sh
    {
        "user": {
            "name": "abd",
            "email": "abd@example.com",
            "password": "password123",
            "password_confirmation": "password123"
        }
    }
```

### Response

```sh
    {
        "user": {
            "id": 7,
            "name": "abd",
            "created_at": "2023-12-12T09:16:01.209Z",
            "updated_at": "2023-12-12T09:16:01.209Z",
            "email": "abd@example.com"
        },
        "message": "User created successfully",
    }
```


<h1>Sign in</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/users/sign_in</p>
<p><strong>method: </strong>POST</p>

### Body

```sh
    {
        "user": {
            "email": "abd@example.com",
            "password": "password123"
        }
    }
```

### Response

```sh
    {
        "user": {
            "id": 7,
            "name": "abd",
            "created_at": "2023-12-12T08:17:10.890Z",
            "updated_at": "2023-12-12T08:17:10.890Z",
            "email": "abd@example.com"
        },
            "message": "Signed in successfully",
            "token": "token_string"
    }
```

<h1>Sign Out</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/users/sign_out</p>
<p><strong>method: </strong>DELETE</p>

### Response

```sh

```


<h1>Create Tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials</p>
<p><strong>method: </strong>POST</p>

## Header

```sh
    {
        headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        },
    }
```

### Body

```sh
    {
        "tutorial": {
            "title": "Rails",
            "description": "Web design basics",
            "tutorial_price": 100,
            "scheduling_price": 10
        }
    }
```

### Response

```sh
    {
    "message": "Tutorial created successfully",
    "tutorial": {
            "id": 9,
            "title": "Ruby",
            "description": "Web design basics",
            "tutorial_price": 100,
            "scheduling_price": 10,
            "author_id": 6,
            "created_at": "2023-12-12T09:20:00.415Z",
            "updated_at": "2023-12-12T09:20:00.415Z"
        }
    }
```

<h1>Create Reservation</h1>
<h2>API:</h2>
<p>hhttp://localhost:3000/api/v1/tutorials/:tutorial_id/reservations</p>
<p><strong>method:</strong>POST</p>

### Header

```sh
    {
        headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        },
    }
```

### Body

```sh
    {
        "reservation": {
            "reserve_date": "2023-12-28"
        }
    }
```

### Response

```sh
    {
        "id": 5,
        "user_id": 6,
        "tutorial_id": 9,
        "reserve_date": "2023-12-28",
        "created_at": "2023-12-12T09:21:49.648Z",
        "updated_at": "2023-12-12T09:21:49.648Z"
    }
```

<h1>Get reservations under a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:tutorial_id/reservations</p>
<p><strong>method: </strong>GET</p>

### Response

```sh
    [
        {
            "id": 5,
            "user_id": 6,
            "tutorial_id": 9,
            "reserve_date": "2023-12-28",
            "created_at": "2023-12-12T09:21:49.648Z",
            "updated_at": "2023-12-12T09:21:49.648Z"
        },
        {
            "id": 6,
            "user_id": 2,
            "tutorial_id": 9,
            "reserve_date": "2023-12-28",
            "created_at": "2023-12-12T09:24:19.139Z",
            "updated_at": "2023-12-12T09:24:19.139Z"
        }
    ]
```


<h1>Get reservations of the signed in User</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/user_reservations</p>
<p><strong>method: </strong>GET</p>

### Header

```sh
    {
        headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        },
    }
```


### Response

```sh
    [
        {
            "id": 6,
            "user_id": 2,
            "tutorial_id": 9,
            "reserve_date": "2023-12-28",
            "created_at": "2023-12-12T09:24:19.139Z",
            "updated_at": "2023-12-12T09:24:19.139Z"
        },
        {
            "id": 7,
            "user_id": 2,
            "tutorial_id": 6,
            "reserve_date": "2023-12-28",
            "created_at": "2023-12-12T09:26:03.217Z",
            "updated_at": "2023-12-12T09:26:03.217Z"
        },
        {
            "id": 8,
            "user_id": 2,
            "tutorial_id": 8,
            "reserve_date": "2023-12-28",
            "created_at": "2023-12-12T09:26:14.942Z",
            "updated_at": "2023-12-12T09:26:14.942Z"
        }
    ]
```


<h1>Get all the tutorials</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials</p>
<p><strong>method: </strong>GET</p>

### Response

```sh
    [
        {
            "id": 7,
            "title": "Django",
            "description": "Web design basics",
            "tutorial_price": 100,
            "scheduling_price": 10,
            "author_id": 3,
            "created_at": "2023-12-12T06:54:28.447Z",
            "updated_at": "2023-12-12T06:54:28.447Z"
        },
        {
            "id": 8,
            "title": "Rails",
            "description": "Web design basics",
            "tutorial_price": 100,
            "scheduling_price": 10,
            "author_id": 6,
            "created_at": "2023-12-12T08:18:14.565Z",
            "updated_at": "2023-12-12T08:18:14.565Z"
        },
        {
            "id": 9,
            "title": "Ruby",
            "description": "Web design basics",
            "tutorial_price": 100,
            "scheduling_price": 10,
            "author_id": 6,
            "created_at": "2023-12-12T09:20:00.415Z",
            "updated_at": "2023-12-12T09:20:00.415Z"
        }
    ]
```


<h1>Delete a reservation of a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:tutorial_id/reservations/:id</p>
<p><strong>method: </strong>DELETE</p>

### Header

```sh
    {
        headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        },
    }
```


<h1>Delete a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:id</p>
<p><strong>method: </strong>DELETE</p>

### Header

```sh
    {
        headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        },
    }
```
