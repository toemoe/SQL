COMMENT ON TABLE person_discounts IS 'Информация о персональных скидках клиентов пиццерии в зависимости от количества заказов';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор каждой записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный идентификатор клиента, кому назначена скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный идентификатор пиццерии, в которой действует скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Размер персональной скидки';
