#!/usr/bin/python3
"""State Module for HBNB project"""

from models.base_model import BaseModel, Base
from models import storage_type
from models.city import City
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

class State(BaseModel, Base):
    """State class/table model"""

    # SQLAlchemy table name
    __tablename__ = 'states'

    # Define attributes based on storage_type
    if storage_type == 'db':
        name = Column(String(128), nullable=False)
        cities = relationship('City', backref='state',
                              cascade='all, delete, delete-orphan')
    else:
        # Default attributes for non-DB storage
        name = ""

        @property
        def cities(self):
            """Returns the list of City instances with state_id equal to the current State.id"""
            from models import storage
            related_cities = []
            cities = storage.all(City)
            for city in cities.values():
                if city.state_id == self.id:
                    related_cities.append(city)
            return related_cities

