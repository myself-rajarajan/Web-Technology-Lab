import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RajaComponent } from './raja.component';

describe('RajaComponent', () => {
  let component: RajaComponent;
  let fixture: ComponentFixture<RajaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [RajaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RajaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
