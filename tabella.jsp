<table class="table table-striped mt-3">
  <thead>
    <tr class="bg-primary text-white rounded">
      <th scope="col">#</th>
      <th scope="col">Utente</th>
      <th scope="col">Ruolo</th>
      <%
        if(session.getAttribute("ruolo").equals(1)){
          out.println("<th scope='col'>Operazioni</th>");
        }
      %>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>

    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
    </tr>
  </tbody>
</table>
