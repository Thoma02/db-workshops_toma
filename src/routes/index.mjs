import { ObjectId } from '@fastify/mongodb'

// function filterUndefined(obj) {
//   return Object.fromEntries(
//     Object.entries(preparedData).filter((value) => value !== null)
//   )
// }

async function getUsers() {
  const users = this.mongo.db.collection('users')

  return users.find().toArray()
}

async function getRestaurants() {
  const users = this.mongo.db.collection('restaurants')

  return users.find().toArray()
}

async function createUser(req) {
  const users = this.mongo.db.collection('users')
  const data = req.body // {}

  const result = await users.insertOne({
    id: data.id,
    phone_number: data.phone,
    fullname: data.fullName,
  });
  return result
}

async function createRestaurant(req) {
  const restaurants = this.mongo.db.collection('restaurants')
  const data = req.body // {}

  const result = await restaurants.insertOne({
    name: data.name,
    cuisine: data.cuisine,
    location: data.location,
    menu: data.menu
  });
  return result
}

async function updateUser() {
  const users = this.mongo.db.collection('users')
  const { id, ...data } = req.body
  const preparedData = {
    phone_number: data.number,
    fullname: data.fullName,
  }

  await users.updateOne(
    { _id: new ObjectId(id) },
    {
      $set: preparedData,
    }
  )
}

async function deleteUser(req) {
  const users = this.mongo.db.collection('users')
  const result = await users.deleteOne({ _id: new ObjectId(req.params.id) })
  return result
}


export default async function routes(fastify, options) {
  fastify.get('/ping', function (req, reply) {
    reply.send({ message: 'pong' })
  })

  fastify.route({
    method: 'GET',
    url: '/restaurants',
    handler: getRestaurants,
    schema: {
      querystring: {
        type: 'object',
        properties: {
          name: { type: 'string' },
          cuisine: { type: 'string' },
          location: { type: 'string' },
          menu: { type: 'string' }
        },
        required: ['name', 'cuisine', 'location', 'menu']
      }
    }
  })

  fastify.route({
    method: 'GET',
    url: '/users',
    handler: getUsers,
    schema: {
      querystring: {
        type: 'object',
        properties: {
          id: {type: 'number'},
          phone_number: { type: 'number' },
          fullname: { type: 'string' }
        },
        required: ['fullname']
      }
    }
  })

  fastify.route({
    method: 'POST',
    url: '/users',
    handler: createUser,
    schema: {
      body: {},
    }
  })

  fastify.route({
    method: 'POST',
    url: '/restaurants',
    handler: createRestaurant,
    schema: {
      body: {},
    }
  })

  fastify.route({
    method: 'PUT',
    url: '/users',
    handler: updateUser,
    schema: {
      body: {}
    }
  })

  fastify.route({
    method: 'DELETE',
    url: '/users:id',
    handler: deleteUser,
    schema: {
      params: {
        userId: { type: 'string' }
      }
    }
  })
}
