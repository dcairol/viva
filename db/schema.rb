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

ActiveRecord::Schema.define(version: 20130831150332) do

  create_table "donantes", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "empresa"
    t.integer  "monto"
    t.string   "periocidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "familias", force: true do |t|
    t.string   "nombre"
    t.string   "grupo"
    t.text     "telefonos"
    t.string   "correo"
    t.text     "direccion"
    t.string   "aval"
    t.integer  "iglesia_id"
    t.string   "tipo_acogimiento"
    t.text     "perfil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iglesias", force: true do |t|
    t.string   "nombre"
    t.string   "pastor"
    t.text     "coordinadores"
    t.text     "direccion"
    t.text     "compromiso_economico"
    t.integer  "region_id"
    t.string   "contacto_administrativo"
    t.string   "telefono"
    t.string   "correos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ninos", force: true do |t|
    t.string   "nombre"
    t.date     "fecha_nacimiento"
    t.integer  "edad"
    t.string   "sexo"
    t.date     "fecha_ingreso"
    t.date     "fecha_egreso"
    t.text     "motivo_ingreso"
    t.text     "motivo_egreso"
    t.date     "fecha_vencimiento_medida"
    t.integer  "oficina_id"
    t.integer  "familia_id"
    t.string   "tipo_acogimiento"
    t.integer  "iglesia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oficinas", force: true do |t|
    t.string   "nombre"
    t.text     "direccion"
    t.string   "responsable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reds", force: true do |t|
    t.string   "nombre"
    t.integer  "region_id"
    t.date     "fecha_nacimiento"
    t.string   "telefono"
    t.text     "direccion"
    t.text     "servicio"
    t.text     "condiciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telefonos", force: true do |t|
    t.string   "telefono"
    t.integer  "telefoneable_id"
    t.string   "telefoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
