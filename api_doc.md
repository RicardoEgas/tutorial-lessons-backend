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


<h1>Sign in</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/users/sign_in</p>
<p><strong>method: </strong>POST</p>

### Body

```sh
    {
        "user": {
            "email": "russel@example.com",
            "password": "password123"
        }
    }
```

<h1>Sign Out</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/users/sign_out</p>
<p><strong>method: </strong>DELETE</p>


<h1>Create Tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials</p>
<p><strong>method: </strong>POST</p>

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

<h1>Create Reservation</h1>
<h2>API:</h2>
<p>hhttp://localhost:3000/api/v1/tutorials/:tutorial_id/reservations</p>
<p><strong>method:</strong>POST</p>

### Body

```sh
    {
        "reservation": {
            "reserve_date": "2023-12-28"
        }
    }
```

<h1>Get reservations under a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:tutorial_id/reservations</p>
<p><strong>method: </strong>GET</p>


<h1>Get reservations of the signed in User</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/user_reservations</p>
<p><strong>method: </strong>GET</p>


<h1>Get all the tutorials</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials</p>
<p><strong>method: </strong>GET</p>


<h1>Delete a reservation of a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:tutorial_id/reservations/:id</p>
<p><strong>method: </strong>DELETE</p>


<h1>Delete a certain tutorial</h1>
<h2>API:</h2>
<p>http://localhost:3000/api/v1/tutorials/:id</p>
<p><strong>method: </strong>DELETE</p>
