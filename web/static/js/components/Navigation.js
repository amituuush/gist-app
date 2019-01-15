import React from "react";
import axios from "axios";
import { Link } from 'react-router-dom';
import {
  Navbar,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink } from 'reactstrap';

class Navigation extends React.Component {
  constructor() {
    super();
  }

  render() {
    return (
      <div className="nav">
        <Navbar color="light" light expand="md">
          <NavbarBrand href="/">Gist</NavbarBrand>
            <Nav className="ml-auto" navbar>
              <NavItem>
                <NavLink href="/components/">Sign Up</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href="https://github.com/reactstrap/reactstrap">Log In</NavLink>
              </NavItem>
            </Nav>
        </Navbar>
      </div>
    );
  }
}

export default Navigation;