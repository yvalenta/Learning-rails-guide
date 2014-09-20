# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140920140609) do

  create_table "ciudades", force: true do |t|
    t.string   "nombre"
    t.string   "cod_dane"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ciudades", ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "departamento_id"
  end

  add_index "clientes", ["ciudad_id"], name: "index_clientes_on_ciudad_id", using: :btree
  add_index "clientes", ["departamento_id"], name: "index_clientes_on_departamento_id", using: :btree

  create_table "departamentos", force: true do |t|
    t.string   "nombre"
    t.string   "cod_dane"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", force: true do |t|
    t.string   "nombre"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "departamento_id"
  end

  add_index "empresas", ["ciudad_id"], name: "index_empresas_on_ciudad_id", using: :btree
  add_index "empresas", ["departamento_id"], name: "index_empresas_on_departamento_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "apodo"
  end

end
